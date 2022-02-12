@extends('admin.layouts.admin')

@section('content')

    <h1>Criar Loja</h1>
    <form method="POST" action="{{ route('admin.stores.store') }}">
        @csrf
        {{-- <input type="hidden" name="_token" value="{{ csrf_token() }}"> --}}
        <div class="form-group">
            <label class="form-label" for="name">Loja</label>
            <input class="form-control" type="text" name="name" id="name">
        </div>

        <div class="form-group">
            <label class="form-label" for="description">Descrição</label>
            <input class="form-control" type="text" name="description" id="description">
        </div>

        <div class="form-group">
            <label class="form-label" for="phone">Telefone</label>
            <input class="form-control" type="text" name="phone" id="phone">
        </div>

        <div class="form-group">
            <label class="form-label" for="mobile_phone">Celular/Whatsapp</label>
            <input class="form-control" type="text" name="mobile_phone" id="mobile_phone">
        </div>

        <div class="form-group">
            <label class="form-label" for="slug">Slug</label>
            <input class="form-control" type="text" name="slug" id="slug">
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
