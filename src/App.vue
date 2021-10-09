<template>
  <div>
    <Field :width="width" :height="height" :minesCount="minesCount" :key="superKey" />
    <br/>
    <div class="props">
      Size: 
      <input type="number" v-model="width"> x 
      <input type="number" v-model="height">
      &nbsp;&nbsp;&nbsp;
      Mines:
      <input type="number" v-model="minesCount">
      &nbsp;&nbsp;&nbsp;
      <button class="refresh" @click="it += 1">🔄</button>
    </div>
  </div>
</template>

<script>
import Field from './components/Field.vue'

export default {
  name: 'App',
  components: {
    Field
  },
  data() {
    return {
      width: 20,
      height: 10,
      minesCount: 50,
      it: 0,
    }
  },
  computed: {
    superKey: function() {
      return this.width + '.' + this.height + '.' + this.minesCount + '.' + this.it;
    }
  },
  watch: {
    width: function () {
      if (this.minesCount > this.width * this.height) this.minesCount = this.width * this.height
    },
    height: function () {
      if (this.minesCount > this.width * this.height) this.minesCount = this.width * this.height
    },
    minesCount: function () {
      if (this.minesCount < 1) this.minesCount = 1
    },
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

.props {
  font-size: 24px;
}
.props input {
  font-size: 24px;
  width: 50px;
}
.refresh {
  font-size: 24px;
}
</style>
