@extends('admin.layouts.admin')

@section('content')

    <h1>Cadastrar Produto</h1>
    <form method="POST" action="{{ route('admin.products.store') }}">
        @csrf
        {{-- <input type="hidden" name="_token" value="{{ csrf_token() }}"> --}}
        <div class="form-group">
            <label class="form-label" for="name">Nome do Produto</label>
            <input class="form-control" type="text" name="name" id="name">
        </div>

        <div class="form-group">
            <label class="form-label" for="description">Descrição</label>
            <input class="form-control" type="text" name="description" id="description">
        </div>

        <div class="form-group">
            <label class="body" for="description">Conteúdo</label>
            <textarea class="form-control" cols="30" rows="10" name="body" id="body"></textarea>
        </div>

        <div class="form-group">
            <label class="form-label" for="price">Preço</label>
            <input class="form-control" type="text" name="price" id="price">
        </div>

        <div class="form-group">
            <label class="form-label" for="slug">Slug</label>
            <input class="form-control" type="text" name="slug" id="slug">
        </div>

        <div class="form-group">
            <label class="form-label" for="store">Loja</label>
            <select class="form-select" name="store" id="store">
                @foreach ($stores as $store)
                    <option value="{{ $store->id }}">{{ $store->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="py-2">
            <button class="btn btn-primary btn-lg">Salvar Produto</button>
        </div>
    </form>

@endsection
