<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\FileUpload;
use Intervention\Image\Facades\Image;

class FileUploadController extends Controller
{
    public function store(Request $request)
    {
        if ($request->get('image') && $request->get('title') && $request->get('text')) {
            $image = $request->get('image');
            $name = time() . '.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];

            Image::make($request->get('image'))->save(public_path('images/') . $name);

            $image = new FileUpload();
            $image->image_name = $name;
            $image->title = $request->get('title');
            $image->description = $request->get('text');
            $image->save();

            return response()->json(['success' => 'You have successfully uploaded an image'], 200);
        } else {
            return response()->json(['error' => 'Not enough parameters'], 400);
        }
    }

    public function show($id)
    {
        $image = FileUpload::find($id);

        return view('image')->with('image', $image);
    }
}
