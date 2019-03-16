@extends('welcome')
@section('content')
    <div class="col-md-12 mt-4 mb-4">
        <div class="row">
            @foreach ($images as $image)
                <div class="image-block col-md-4 mt-3">
                    <a href="/image/{{$image->id}}">
                        <h3>{{$image->title}}</h3>
                        <img class="img-responsive" src="{{URL::asset('/images/' . $image->image_name)}}"/>
                        <span class="img-text">{!! $image->description !!}</span>
                        <a/>
                </div>
            @endforeach
        </div>
    </div>
@endsection
