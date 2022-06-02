<template>
<div id="app">
  <img :style="intuitive_care_img" scr='"C:\Users\Leona\PycharmProjects\IC\teste_4\vue\frontend\public\intuitive_care_icon.webp"'>
  <div :style ="input_divstl" sclass="input-group mb-3">
    <input :style="inputstl" type="text" class="form-control" placeholder="Operadoras" v-model="operadoras">
      <div class="input-group-append">
      <button :style="btnstl" @click="get_data" class="btn btn-success" type="submit">BUSCAR</button>
      </div>
  </div>

  <div :style="resultstl">
    <h3 :style="headerstl">Operadoras:</h3>
    <li v-for="values in posts" :key="values.id"> 
    {{values}}
    </li>
  </div>

</div>
</template>

<script>
import axios from 'axios';
export default {
  data() {
    return {
      inputstl: {
        width: '30%'
      },
      btnstl: {
        margin: 'auto'
      },
      input_divstl:{  
        margin: 'auto',
        width: '50%',
        padding: '15px' 
      },
      resultstl: {
        margin: 'auto',
        width: '50%',
        border: '3px solid green',
        padding: '10px',
      },
      posts: {},
      operadora: "",
    };
  },
  
  methods: {
    async get_data() {
      try {
        const response = await axios.get(
          `http://127.0.0.1:5000/get/${this.operadoras}`
        )
        this.posts = response.data
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>