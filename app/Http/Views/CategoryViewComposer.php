<?php

namespace App\Http\Views;

use App\Models\Category;
//use Illuminate\Support\Facades\View;
use Illuminate\View\View;

class CategoryViewComposer
{

    private $category;

    public function __construct(Category $category)
    {
        $this->category = $category;
    }
    public function compose(View $view)

    {
        $categories = $this->category->all();
        $view->with('categories', $categories);
    }
}
