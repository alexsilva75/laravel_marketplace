@extends('admin.layouts.admin')

@section('content')

    <h1>Criar Loja</h1>
    <form method="POST" action="{{ route('admin.stores.store') }}">
        @csrf
        {{-- <input type="hidden" name="_token" value="{{ csrf_token() }}"> --}}
        <div class="form-group">
            <label class="form-label" for="name">Loja</label>
            <input class="form-control @error('name') is-invalid @enderror" type="text" name="name" id="name"
                value="{{ old('name') }}">
            @error('name')
                <p class="invalid-feedback">{{ $message }}</p>
            @enderror
        </div>

        <div class="form-group">
            <label class="form-label" for="description">Descrição</label>
            <input class="form-control @error('description') is-invalid @enderror" type=" text" name="description"
                id="description" value="{{ old('description') }}">
            @error('description')
                <p class="invalid-feedback">{{ $message }}</p>
            @enderror
        </div>

        <div class="form-group">
            <label class="form-label" for="phone">Telefone</label>
            <input class="form-control @error('phone') is-invalid @enderror" type="text" name="phone" id="phone"
                value="{{ old('phone') }}">
            @error('phone')
                <p class="invalid-feedback">{{ $message }}</p>
            @enderror
        </div>

        <div class="form-group">
            <label class="form-label" for="mobile_phone">Celular/Whatsapp</label>
            <input class="form-control @error('mobile_phone') is-invalid @enderror" type="text" name="mobile_phone"
                id="mobile_phone" value="{{ old('mobile_phone') }}">
            @error('mobile_phone')
                <p class="invalid-feedback">{{ $message }}</p>
            @enderror
        </div>

        <div class="form-group">
            <label class="form-label" for="slug">Slug</label>
            <input class="form-control" type="text" name="slug" id="slug" value="{{ old('slug') }}">
        </div>

        {{-- <div class="form-group">
            <label class="form-label" for="user">Usuário</label>
            <select class="form-select" name="user" id="user">
                @foreach ($users as $user)
                    <option value="{{ $user->id }}">{{ $user->name }}</option>
                @endforeach
            </select>
        </div> --}}
        <div class="py-2">
            <button class="btn btn-primary btn-lg">Criar Loja</button>
        </div>
    </form>

@endsection
