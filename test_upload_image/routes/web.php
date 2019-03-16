<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::post('/images/store', 'FileUploadController@store');
Route::get('/gallery/', function () {
    $image_files = \App\FileUpload::all();
    return view('images')->with('images', $image_files);
});
Route::get('/image/{id}', 'FileUploadController@show');