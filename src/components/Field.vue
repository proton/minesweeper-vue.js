<template>
  <div class="field">
    <div v-for="y in field.length" :key="y" style="padding:0;margin:0;">
      <span v-for="x in field[0].length" :key="x">
        <Tile :x="x" :y="y" :cell="field[y-1][x-1]" />
      </span>
    </div>
  </div>
</template>

<script>
import Tile from './Cell.vue'
export default {
  components: { Tile },
  name: 'Field',
  props: {
    width: Number,
    height: Number,
    minesCount: Number,
  },
  methods: {
    generateField() {
      for (let y = 0; y < this.height; ++y) {
        this.field[y] = []
        for (let x = 0; x < this.height; ++x) {
          this.field[y][x] = {
            bomb: false,
            n: undefined,
            visible: true,
            error: false,
          }
        }
      }
      // place mines
      let n = this.minesCount
      while (n > 0) {
        let y = Math.floor(Math.random() * this.height)
        let x = Math.floor(Math.random() * this.width)
        if (this.field[y][x].bomb) continue
        this.field[y][x].bomb = true
        --n
      }
    }
  },
  data() {
    return {
      field: []
    }
  },
  mounted() {
    this.generateField()
  },
}
</script>

<style scoped>
  .field {
    /* border: 1px black solid; */
  }
</style>
