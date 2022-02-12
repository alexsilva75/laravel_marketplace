@extends('admin.layouts.admin')

@section('content')

    <h1>Cadastrar Produto</h1>
    <form method="POST" action="{{ route('admin.products.store') }}">
        @csrf
        {{-- <input type="hidden" name="_token" value="{{ csrf_token() }}"> --}}
        <div class="form-group">
            <label class="form-label" for="name">Nome do Produto</label>
            <input class="form-control @error('name') is-invalid @enderror" type="text" name="name" id="name"
                value="{{ old('name') }}">
            @error('name')
                <p class="invalid-feedback">{{ $message }}</p>
            @enderror
        </div>

        <div class="form-group">
            <label class="form-label" for="description">Descrição</label>
            <input class="form-control @error('description') is-invalid @enderror" type="text" name="description"
                id="description" value="{{ old('description') }}">
            @error('description')
                <p class="invalid-feedback">{{ $message }}</p>
            @enderror
        </div>

        <div class="form-group">
            <label class="body" for="description">Conteúdo</label>
            <textarea class="form-control @error('body') is-invalid @enderror" cols="30" rows="10" name="body"
                id="body">{{ old('body') }}</textarea>
            @error('body')
                <p class="invalid-feedback">{{ $message }}</p>
            @enderror
        </div>

        <div class="form-group">
            <label class="form-label" for="price">Preço</label>
            <input class="form-control @error('price') is-invalid @enderror" type="text" name="price" id="price"
                value="{{ old('price') }}">
            @error('price')
                <p class="invalid-feedback">{{ $message }}</p>
            @enderror
        </div>

        <div class="form-group">
            <label class="form-label" for="slug">Slug</label>
            <input class="form-control" type="text" name="slug" id="slug">
        </div>


        <div class="py-2">
            <button class="btn btn-primary btn-lg">Salvar Produto</button>
        </div>
    </form>

@endsection
