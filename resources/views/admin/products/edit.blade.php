@extends('admin.layouts.admin')

@section('content')
    <h1>Editar Produto</h1>
    <form method="POST" action="{{ route('admin.products.update', ['product' => $product->id]) }}"
        enctype="multipart/form-data">
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

        {{-- <div class="form-group">
            <label class="form-label" for="slug">Slug</label>
            <input class="form-control" type="text" name="slug" id="slug" value="{{ $product->slug }}">
        </div> --}}

        <div class="form-group">
            <label class="form-label" for="categories">Categoria</label>
            <select class="form-select" name="categories[]" id="categories" multiple>
                @foreach ($categories as $category)
                    <option value="{{ $category->id }}" @if ($product->categories->contains($category->id)) selected @endif>
                        {{ $category->name }}
                    </option>
                @endforeach

            </select>
        </div>
        <div class="form-group">
            <label for="photos" class="form-label">Fotos do Produto</label>
            <input type="file" class="form-control @error('photos.*') is-invalid @enderror" name="photos[]" id="photos"
                multiple>
            @error('photos.*')
                <p class="invalid-feedback">{{ $message }}</p>
            @enderror
        </div>

        <div class="py-2">
            <button class="btn btn-primary btn-lg">Alterar Produto</button>
        </div>
    </form>

    <hr>

    <div class="row">
        <div class="col-12 d-flex">

            @foreach ($product->photos as $photo)
                <div class="d-flex flex-column justify-content-between p-2">

                    <img src="{{ asset('storage/' . $photo->image) }}" class="img-fluid p-4" width="100%" alt="">
                    <form method="POST" action="{{ route('admin.photo.remove') }}">
                        @csrf
                        <input type="hidden" name="photoName" value="{{ $photo->image }}">
                        <button class="btn btn-lg btn-danger">Remover</button>
                    </form>
                </div>
            @endforeach
        </div>
    </div>
@endsection
