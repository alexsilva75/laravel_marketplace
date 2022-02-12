<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            //
            'name' => 'required',
            'description' => 'required|min:10',
            'phone' => 'required',
            'mobile_phone' => 'required',
        ];
    }


    public function messages()
    {
        return [
            //
            'name.required' => 'O campo \'Nome\' não pode ficar em branco.',
            'description.required' => 'O campo \'Descrição\' não pode ficar em branco.',
            'description.min' => 'O campo \'Descrição\' precisa ter, pelo menos, :min caracteres.',
            'phone.required' => 'O campo \'Telefone\' não pode ficar em branco.',
            'mobile_phone.required' => 'O campo \'Celular/Whatsapp\' não pode ficar em branco.',
        ];
    }
}