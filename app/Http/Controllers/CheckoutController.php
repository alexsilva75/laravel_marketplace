<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\UserOrder;
use App\Payment\PagSeguro\CreditCard;
use App\Models\Store;

class CheckoutController extends Controller
{
    //


    public function index()
    {
        if (!auth()->check()) {
            return redirect()->route('login');
        }

        if (!session()->has('cart')) {
            return redirect()->route('home');
        }

        $this->makePagSeguroSession();

        $total = 0;

        $cartItems = array_map(function ($item) {
            //
            return $item['amount'] * $item['price'];
        }, session()->get('cart'));

        $total = array_sum($cartItems);

        return view('checkout', compact('total'));
    }
    public function process(Request $request)
    {
        try {
            $dataPost = $request->all();
            $cartItems = session()->get('cart');
            $stores = array_unique(array_column($cartItems, 'store_id'));
            $user = auth()->user();
            $reference = 'XPTO';



            $creditCardPayment = new CreditCard(
                $cartItems,
                $user,
                $dataPost,
                $reference
            );

            $result = $creditCardPayment->doPayment();

            $userOrder = [
                'reference' => $reference,
                'pagseguro_code' => $result->getCode(),
                'pagseguro_status' => $result->getStatus(),
                'items' => serialize($cartItems),
                'store_id' => 42,
                'user_id' => $user->id,
            ];

            $stores = array_unique(array_column($cartItems, 'store_id'));

            $createdUserOrder = $user->orders()->create($userOrder);





            $createdUserOrder->stores()->sync($stores);

            //Notificar loja sobre o novo pedido
            $store = (new Store())->notifyStoreOwners($stores);


            session()->forget('cart');
            session()->forget('pagseguro_session_code');

            return response()->json([
                'data' => [
                    'status' => true,
                    'message' => 'Seu Pedido foi recebido!',
                    'order' => $reference,
                ]
            ]);
        } catch (\Throwable $th) {
            //throw $th;
            $message = env('APP_DEBUG') ? $th->getMessage() : 'Erro ao criar pedido!';
            return response()->json([
                'data' => [
                    'status' => false,
                    'message' => $message,
                    'errorMessage' => $th->getMessage(),

                ]
            ], 401);
        }
    }


    public function thanks()
    {
        return view('thanks');
    }

    private function makePagSeguroSession()
    {

        if (!session()->has('pagseguro_session_code')) {
            //
            $sessionCode = \PagSeguro\Services\Session::create(
                \PagSeguro\Configuration\Configure::getAccountCredentials()
            );

            //dd($sessionCode);
            session()->put('pagseguro_session_code', $sessionCode->getResult());
        }

        return session()->get('pagseguro_session_code');
    }
}
