<template>
  <div>
    <div>
      <nav class="navbar navbar-light bg-light">
        <form class="form-inline">
          <input class="form-control mr-sm-2" type="search" placeholder="busque operadoras..." aria-label="Search" v-model="operadora">
          <button @click="getData" class="btn btn-outline-success my-2 my-sm-0"  type="submit">Search</button>
        </form>
      </nav>
    </div>
    <h1> {{posts}}</h1>
    <div v-for="post in posts" v-bind:key="post.id">
      <p>{{post}}</p>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      posts: {},
      operadora: "",
    };
  },

  methods: {
    async getData() {
      try {
        const response = await this.$http.get(
          `http://127.0.0.1:5000/get/${this.operadora}`
        )
        // JSON responses are automatically parsed.
        this.posts = response.data
        console.log('foi');
      } catch (error) {
        console.log(error);
      }
    },

  },
};
</script>