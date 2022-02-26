<?php

namespace App\Http\Views;

use App\Models\Category;
use Illuminate\Support\Facades\View;

class CategoryViewComposer
{

    private $category;

    public function __construct(Category $category)
    {
        $this->category = $category;
    }
    public function compose($view)

    {
        $categories = $this->category->all();
        return $view->with('categories', $categories);
    }
}
