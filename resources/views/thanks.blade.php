@extends('layouts.front')

@section('content')
    <h1>Muito Obrigado por sua compra!</h1>
    <h2 class="alert alert-success">
        Seu pedido foi recebido e está sendo processado! Código do pedido: {{ request()->get('order') }}
    </h2>
@endsection
