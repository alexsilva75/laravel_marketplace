@extends('admin.layouts.admin')

@section('content')
<div class="row">
    <div class="col-12">
        <h2>Pedidos Recebidos</h2>
        <hr>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <div class="accordion" id="accordionExample">
            @forelse ($orders as $key => $order)
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne{{$key}}">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne{{$key}}" aria-expanded="true" aria-controls="collapseOne">
                            Pedido nº {{$order->reference}}
                        </button>
                    </h2>
                    <div id="collapseOne{{$key}}"
                    class="accordion-collapse collapse @if ($key == 0) show @endif"
                    aria-labelledby="headingOne"
                    data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                        </div>
                    </div>
                </div>
            @empty

            @endforelse
        </div>


    </div>
</div>
<div class="row">
    <div class="col-12">
        <hr>
        {{$orders->links()}}
    </div>
</div>
@endsection
