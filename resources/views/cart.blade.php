@extends('layouts.front')

@section('content')
    <div class="row">
        <div class="col-12">
            <h2>Carrinho de compras</h2>
            <hr>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            @if ($cart)
                <table class="table striped">
                    <thead>
                        <tr>
                            <th>Produto</th>
                            <th>Preço</th>
                            <th>Quantidade</th>
                            <th>Subtotal</th>
                            <th>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php
                            $total = 0;
                        @endphp
                        @foreach ($cart as $c)
                            <tr>
                                <td>{{ $c['name'] }}</td>
                                <td>R&#36;&nbsp;{{ number_format($c['price'], 2, ',', '.') }}</td>
                                <td>{{ $c['amount'] }}</td>
                                <td>R&#36;&nbsp;{{ number_format($c['price'] * $c['amount'], 2, ',', '.') }}</td>
                                <td><a href="{{ route('cart.remove', ['slug' => $c['slug']]) }}"
                                        class="btn btn-sm btn-danger">Remover</a></td>
                            </tr>
                            @php
                                $total += $c['price'] * $c['amount'];
                            @endphp
                        @endforeach
                        <tr>
                            <td colspan="3">Total:</td>
                            <td>R&#36;&nbsp;{{ number_format($total, 2, ',', '.') }}</td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
                <hr>
                <div class="d-flex justify-content-between">
                    <a href="{{ route('cart.cancel') }}" class="btn btn-lg btn-danger ">Cancelar compra</a>
                    <a href="{{ route('checkout.index') }}" class="btn btn-lg btn-success ">Concluir compra</a>

                </div>

            @else
                <p class="text-muted alert alert-warning">Não há produtos adicionados no carrinho.</p>
            @endif
        </div>
    </div>
@endsection
