@extends('layouts.front')

@section('content')
    <div class="row">
        <div class="col-4">
            @if ($product->photos->count())
                <img src="{{ asset('storage/' . $product->photos->first()->image) }}" class="card-img-top" alt="">
                {{-- <img src="{{ asset('storage/' . $product->photos->first()->image) }}" class="card-img-top"
    alt=""> --}}
            @else
                {{-- <img src="{{ asset('assets/img/no-photo.jpg') }}" class="card-img-top" alt=""> --}}
                <img class="card-img-top" src="{{ asset('assets/img/no-photo.jpg') }}" alt="">
            @endif
            <div class="row mt-2">
                @foreach ($product->photos as $photo)
                    <div class="col-md-4">
                        <img src="{{ asset('storage/' . $photo->image) }}" alt="" class="img-fluid">
                    </div>
                @endforeach
            </div>
        </div>
        <div class="col-8">
            <div>

                <h2>{{ $product->name }}</h2>
                <p>{{ $product->description }}</p>
                <h3>R$ {{ number_format($product->price, 2, ',', '.') }}</h3>
                <span>
                    {{ $product->store->name }}
                </span>
            </div>
            <div class="product-add">
                <hr>
                <form method="POST" action="{{ route('cart.add') }}">
                    @csrf
                    <input type="hidden" name="product[name]" value="{{ $product->name }}">
                    <input type="hidden" name="product[price]" value="{{ $product->price }}">
                    <input type="hidden" name="product[slug]" value="{{ $product->slug }}">
                    <div class="form-group">
                        <div class="row">

                            <div class="col-md-4 py-2">
                                <label for="" class="form-label">Quantidade</label>
                                <input type="number" name="product[amount]" id="" class="form-control" value="1">
                            </div>
                        </div>

                    </div>
                    <button type="submit" class="btn btn-lg btn-danger">Comprar</button>
                </form>
            </div>

        </div>


    </div>
    <div class="row">
        <div class="col-12">
            <hr>
            {{ $product->body }}
        </div>
    </div>
@endsection
