@extends('admin.layouts.admin')

@section('content')
    @if (!$store)
        <a href="{{ route('admin.stores.create') }}" class="btn btn-success btn-lg">+ Nova Loja</a>
    @endif
    <table class="table table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Loja</th>
                <th>Total de Produtos</th>
                <th>Ações</th>

            </tr>
        </thead>
        <tbody>
            {{-- @foreach ($stores as $store) --}}
            <tr>
                <td>{{ $store->id }}</td>
                <td>{{ $store->name }}</td>
                <td>{{ $store->products->count() }}</td>
                <td><a href="{{ route('admin.stores.edit', ['store' => $store->id]) }}"
                        class="btn btn-default btn-sm me-2">Editar</a>
                    <form class="d-inline-block" method="POST"
                        action="{{ route('admin.stores.destroy', ['store' => $store->id]) }}">
                        @csrf
                        @method('DELETE')

                        <button type="submit" class="btn btn-danger btn-sm">Remover</button>
                    </form>
                </td>
            </tr>
            {{-- @endforeach --}}
        </tbody>
    </table>
    {{-- {{ $stores->links() }} --}}
@endsection
