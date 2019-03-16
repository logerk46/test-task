<template>
    <div class="container" id="app">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card card-default">
                    <div class="card-header">File Upload Component</div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-9">
                                <input type="file" v-on:change="onImageChange" class="form-control" accept="image/*">
                            </div>
                            <div class="col-md-3">
                                <button class="btn btn-success btn-block" @click="uploadImage">Upload Image</button>
                            </div>
                        </div>
                        <div class="errors-image_input mt-1">
                            <p v-if="errorMsgSize">{{errorMsgSize}}</p>
                        </div>
                        <div class="row">
                            <div class="col-md-12" v-if="image">
                                <label class="mt-4">Input title: </label>
                                <input type="text" :maxlength="titleMaxLength" class="img-text_input"
                                       v-model="imageTitle"/>
                                <label class="mt-4">Input text: </label>
                                <input type="text" :maxlength="textMaxLength" class="img-text_input"
                                       v-model="imageText"/>
                                <p class="max-length_input mt-1">Characters left:{{textMaxLength -
                                    imageText.length}}</p>
                                Font size:
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-4 text-size" @click="textSize = '12'">12</div>
                                        <div class="col-md-4 text-size" @click="textSize = '8'">8</div>
                                        <div class="col-md-4 text-size" @click="textSize = '16'">16</div>
                                    </div>
                                </div>

                                Text colors:
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-4 text-colors" @click="textColor='green'">1</div>
                                        <div class="col-md-4 text-colors" @click="textColor='white'">2</div>
                                        <div class="col-md-4 text-colors" @click="textColor='red'">3</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 mt-4 text-center" v-if="image">
                                <img :src="image" class="img-responsive">
                                <span class="img-text"
                                      :style="{color: textColor, fontSize: textSize + 'px'}">{{imageText}}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<style scoped>
    .text-colors, .text-size {
        border: 1px solid black;
        cursor: pointer;
    }

    .text-colors:nth-child(1) {
        background-color: green;
    }

    .text-colors:nth-child(3) {
        background-color: red;
    }

    .img-responsive {
        max-width: 100%;
        max-height: 100%;
    }

    .img-text_input {
        width: 100%;
    }

    .img-text_input {
        position: relative;
        top: -20%;
    }

    .max-length_input {
        font-size: 13px;
        color: #2fa360;
    }

    .errors-image_input p {
        color: red;
    }
</style>
<script>
  export default {
    data() {
      return {
        image: '',
        imageText: '',
        imageTitle: '',
        textMaxLength: 100,
        titleMaxLength: 45,
        errorMsgSize: '',
        textColor: 'white',
        textSize: '12',
      };
    },
    methods: {
      onImageChange(e) {
        let img;
        let vm = this;
        var _URL = window.URL || window.webkitURL;

        let files = e.target.files || e.dataTransfer.files;

        if (!files.length)
          return;

        img = new Image();
        img.onload = function() {
          if (this.width > 800 || this.height > 800) {
            alert('Height and width must not exceed 800px.');
          } else {
            vm.createImage(files[0]);
          }
        };
        img.src = _URL.createObjectURL(files[0]);
        if (files[0].size > 500 * 500) {
          this.errorMsgSize = 'Maximum file size 500kb';
        }
      },
      createImage(file) {
        let reader = new FileReader();
        let vm = this;
        this.imageText = '';
        reader.onload = (e) => {
          vm.image = e.target.result;
        };
        reader.readAsDataURL(file);
      },
      uploadImage() {
        axios.post('/images/store', {
          image: this.image,
          text: '<p style="color:' + this.textColor + '; font-size: ' + this.textSize + 'px;">' + this.imageText + '</p>',
          title: this.imageTitle,
        }).then(response => {
          window.location.href = '/gallery';
        });
      },
    },
  };
</script>