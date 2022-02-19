@extends('admin.layouts.admin')

@section('content')
    <a href="{{ route('admin.products.create') }}" class="btn btn-success btn-lg">+ Novo Produto</a>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Loja</th>
                <th>Produto</th>
                <th>Preço</th>
                <th>Ações</th>

            </tr>
        </thead>
        <tbody>
            @foreach ($products as $product)
                <tr>
                    <td>{{ $product->id }}</td>
                    <td>{{ $product->store->name }}</td>
                    <td>{{ $product->name }}</td>
                    <td>R$ {{ number_format($product->price, 2, ',', '.') }}</td>
                    <td>
                        <div class="btn-group">

                            <a href="{{ route('admin.products.edit', ['product' => $product->id]) }}"
                                class="btn btn-default btn-sm me-2">Editar</a>
                            <form class="d-inline-block" method="POST"
                                action="{{ route('admin.products.destroy', ['product' => $product->id]) }}">
                                @csrf
                                @method('DELETE')

                                <button type="submit" class="btn btn-danger btn-sm">Remover</button>
                            </form>
                        </div>


                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
    {{ empty($products) ? 'Não há produtos cadastrados.' : $products->links() }}
@endsection
