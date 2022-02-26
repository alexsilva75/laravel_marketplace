@extends('layouts.front')

@section('stylesheets')
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
@endsection

@section('content')
    <div class="container-fluid">
        <h2>Pagamento</h2>
        <hr>
        <div class="row">
            <div class="col-md-6">

                <form method="POST" action="">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="form-label">Titular do Cartão <small>(Nome como aparece no cartão)</small>

                                    <input type="text" name="card_name" id="" class="form-control">

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="form-label">Cartão de Crédito <span class="brand"></span></label>
                                <input type="text" name="card_number" id="" class="form-control">
                                <input type="hidden" name="card_brand">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="form-label">Mês de Expiração</label>
                                <input type="number" name="card_month" id="" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="form-label">Ano de Expiração</label>
                                <input type="number" name="card_year" id="" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="form-label">Código de Segurança</label>
                                <input type="number" name="card_cvv" id="" class="form-control">
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div id="installments-options" class="form-group">

                            </div>
                        </div>
                    </div>
                    <button id="process-checkout-button" class="btn btn-lg btn-success my-2">Efetuar pagamento</button>
                    {{-- {{ session()->get('pagseguro_session_code') }} --}}
                </form>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <!-- Incluíndo o arquivo JS do PagSeguro e o JQuery-->
    <script type="text/javascript"
        src="https://stc.sandbox.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.directpayment.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>


    <script>
        const sessionId = '{{ session()->get('pagseguro_session_code') }}';
        PagSeguroDirectPayment.setSessionId(sessionId);
    </script>

    <script>
        const totalPriceTransaction = {{ $total }};
        let cardNumberInput = document.querySelector('input[name=card_number]');
        cardNumberInput.addEventListener('keyup', function(event) {
            //console.log(event);
            let cardNumber = cardNumberInput.value;
            if (cardNumber.length >= 6) {
                //
                PagSeguroDirectPayment.getBrand({
                    cardBin: cardNumber.substring(0, 6),
                    success: function(res) {

                        const brandEl = document.querySelector('.brand');

                        const brandImgEl = document.createElement('img');

                        const brandName = res.brand.name;
                        const inputBrandEl = document.querySelector('input[name=card_brand]');
                        inputBrandEl.value = brandName;
                        brandImgEl.src =
                            `https://stc.pagseguro.uol.com.br/public/img/payment-methods-flags/68x30/${brandName}.png`;
                        if (brandEl.hasChildNodes()) {

                            let currentImgEl = brandEl.childNodes[0];

                            if (!(currentImgEl.src === brandImgEl.src)) {
                                brandEl.removeChild(currentImgEl);
                                brandEl.appendChild(brandImgEl);
                            }


                        } else {
                            brandEl.appendChild(brandImgEl);
                        }
                        getInstallments(totalPriceTransaction, brandName);

                    },
                    error: function(err) {
                        console.log('Error: ', err);
                    },
                    complete: function(res) {
                        console.log('Complete: ', res);
                    }
                });
            }
        });

        let submitButton = document.getElementById('process-checkout-button');

        submitButton.addEventListener('click', function(event) {
            event.preventDefault();

            PagSeguroDirectPayment.createCardToken({
                cardNumber: document.querySelector('input[name=card_number]').value,
                brand: document.querySelector('input[name=card_brand]').value,
                cvv: document.querySelector('input[name=card_cvv]').value,
                expirationMonth: document.querySelector('input[name=card_month]').value,
                expirationYear: document.querySelector('input[name=card_year]').value,
                success: function(res) {
                    console.log(res);
                    processPayment(res.card.token);
                },
                error: function(err) {

                }
            });
        });

        function processPayment(token) {
            const data = {
                card_token: token,
                card_name: document.querySelector('input[name=card_name]').value,
                total_price: {{ $total }},
                hash: PagSeguroDirectPayment.getSenderHash(),
                installment: document.querySelector('.selectInstallments').value,
                _token: '{{ csrf_token() }}'
            };

            $.ajax({
                type: 'POST',
                url: "{{ route('checkout.process') }}",
                data,
                dataType: 'json',
                success: function(res) {
                    // console.log('Ajax response: ', res);
                    // alert(res.data.message);
                    toastr.success(res.data.message, 'Sucesso!')
                    window.location.href = '{{ route('checkout.thanks') }}?order=' + res.data.order
                },
                error: function(err) {
                    console.log('Error processing payment: ', err);
                }
            });
        }

        function getInstallments(amount, brand) {
            console.log('getInstallments: ', brand);
            PagSeguroDirectPayment.getInstallments({
                amount,
                brand,
                maxInstallmentNoInterest: 0,
                success: function(res) {
                    console.log('Success getting installments: ', res.installments[brand]);
                    drawSelectInstallments(res.installments[brand])
                },
                error: function(err) {
                    console.log('Error getting installments: ', err);
                },
                complete: function(res) {

                },
            })
        }

        function drawSelectInstallments(installments) {
            console.log('Installments: ', installments);
            let select = '<label>Opções de Parcelamento:</label>';

            select += '<select class="form-control selectInstallments">';

            for (let l of installments) {
                select +=
                    `<option value="${l.quantity}|${l.installmentAmount}">${l.quantity}x de ${l.installmentAmount} - Total fica ${l.totalAmount}</option>`;
            }


            select += '</select>';

            const installmentOptionsFormGroupEl = document.getElementById('installments-options');


            //console.log('Select: ', select);
            if (installmentOptionsFormGroupEl.hasChildNodes()) {
                installmentOptionsFormGroupEl.innerHTML = '';
                ///installmentOptionsFormGroupEl.removeChild(installmentOptionsFormGroupEl.childNodes[0]);
            }
            installmentOptionsFormGroupEl.innerHTML = select;
            return select;
        }
    </script>
@endsection
