@extends('admin.layouts.admin')

@section('content')
    <h1>Cadastrar Produto</h1>
    <form method="POST" action="{{ route('admin.products.update', ['product' => $product->id]) }}">
        @csrf
        @method('PUT')
        {{-- <input type="hidden" name="_token" value="{{ csrf_token() }}"> --}}
        <div class="form-group">
            <label class="form-label" for="name">Nome do Produto</label>
            <input class="form-control" type="text" name="name" id="name" value="{{ $product->name }}">
        </div>

        <div class="form-group">
            <label class="form-label" for="description">Descrição</label>
            <input class="form-control" type="text" name="description" id="description"
                value="{{ $product->description }}">
        </div>

        <div class="form-group">
            <label class="body" for="description">Conteúdo</label>
            <textarea class="form-control" cols="30" rows="10" name="body" id="body">{{ $product->body }}</textarea>
        </div>

        <div class="form-group">
            <label class="form-label" for="price">Preço</label>
            <input class="form-control" type="text" name="price" id="price" value="{{ $product->price }}">
        </div>

        <div class="form-group">
            <label class="form-label" for="slug">Slug</label>
            <input class="form-control" type="text" name="slug" id="slug" value="{{ $product->slug }}">
        </div>


        <div class="py-2">
            <button class="btn btn-primary btn-lg">Alterar Produto</button>
        </div>
    </form>


@endsection
