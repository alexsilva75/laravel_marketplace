@extends('admin.layouts.admin')

@section('content')
    <h1>Criar Loja</h1>
    <form method="POST" action="{{ route('admin.stores.update', ['store' => $store->id]) }}"
        enctype="multipart/form-data">
        @csrf
        @method('PUT')
        {{-- <input type="hidden" name="_token" value="{{ csrf_token() }}"> --}}
        <div class="form-group">
            <label class="form-label" for="name">Loja</label>
            <input class="form-control" type="text" name="name" id="name" value="{{ $store->name }}">
        </div>

        <div class="form-group">
            <label class="form-label" for="description">Descrição</label>
            <input class="form-control" type="text" name="description" id="description"
                value="{{ $store->description }}">
        </div>

        <div class="form-group">
            <label class="form-label" for="phone">Telefone</label>
            <input class="form-control" type="text" name="phone" id="phone" value="{{ $store->phone }}">
        </div>

        <div class="form-group">
            <label class="form-label" for="mobile_phone">Celular/Whatsapp</label>
            <input class="form-control" type="text" name="mobile_phone" id="mobile_phone"
                value="{{ $store->mobile_phone }}">
        </div>

        {{-- <div class="form-group">
            <label class="form-label" for="slug">Slug</label>
            <input class="form-control" type="text" name="slug" id="slug" value="{{ $store->slug }}">
        </div> --}}

        <div class="form-group">
            <label for="logo" class="form-label">Logomarca da Loja</label>
            <input type="file" class="form-control @error('logo') is-invalid @enderror" name="logo" id="logo">
            @error('logo')
                <p class="invalid-feedback">{{ $message }}</p>
            @enderror
        </div>

        <div class="py-2">
            <button class="btn btn-primary btn-lg">Alterar Loja</button>
        </div>
    </form>
@endsection
