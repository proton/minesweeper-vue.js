<template>
  <div class="field">
    <div v-for="y in field.length" :key="y" class="row">
      <span v-for="x in field[0].length" :key="x">
        <Cell :x="x-1" :y="y-1" :cell="field[y-1][x-1]" @clicked="revealCell" @rightClicked="toggleFlag" />
      </span>
    </div>
  </div>
</template>

<script>
import Cell from './Cell.vue'
export default {
  components: { Cell },
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
        for (let x = 0; x < this.width; ++x) {
          const cell = {
            bomb: false,
            n: undefined,
            visible: false,
            error: false,
            success: false,
            flag: false,
          }
          this.field[y][x] = cell
          this.cells.push(cell)
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
      // place numbers
      for (let y = 0; y < this.height; ++y)
      for (let x = 0; x < this.width; ++x) {
        if (this.field[y][x].bomb) continue
        let cnt = 0
        if (this.hasBomb(y - 1, x - 1)) ++cnt
        if (this.hasBomb(y - 1, x    )) ++cnt
        if (this.hasBomb(y - 1, x + 1)) ++cnt
        if (this.hasBomb(y    , x - 1)) ++cnt
        if (this.hasBomb(y    , x + 1)) ++cnt
        if (this.hasBomb(y + 1, x - 1)) ++cnt
        if (this.hasBomb(y + 1, x    )) ++cnt
        if (this.hasBomb(y + 1, x + 1)) ++cnt
        this.field[y][x].n = cnt
      }
    },
    hasBomb(y, x) {
      return this.field[y] && this.field[y][x] && this.field[y][x].bomb
    },
    revealCell(data) {
      let cell = this.field[data.y] && this.field[data.y][data.x]
      if (!cell) return
      if (cell.visible) return
      if (cell.flag) return

      cell.visible = true
      if (cell.bomb) {
        cell.error = true
        this.makeAllCellsVisible()
      }
      else if (cell.n === 0) {
        this.revealCell({x: data.x - 1, y: data.y - 1})
        this.revealCell({x: data.x - 1, y: data.y    })
        this.revealCell({x: data.x - 1, y: data.y + 1})
        this.revealCell({x: data.x,     y: data.y - 1})
        this.revealCell({x: data.x,     y: data.y + 1})
        this.revealCell({x: data.x + 1, y: data.y - 1})
        this.revealCell({x: data.x + 1, y: data.y    })
        this.revealCell({x: data.x + 1, y: data.y + 1})
      }
      this.checkWin()
    },
    toggleFlag(data) {
      let cell = this.field[data.y] && this.field[data.y][data.x]
      if (!cell) return
      if (cell.visible) return

      cell.flag = !cell.flag
      this.checkWin()
    },
    makeAllCellsVisible() {
      for (const cell of this.cells) {
        cell.visible = true
        if (cell.flag) {
          if (cell.bomb) cell.success = true
          else cell.error = true
        }
      }
    },
    checkWin() {
      const allBombCellsFlagged = this.cells.filter(cell => cell.bomb).every(cell => cell.flag)
      const allFlagCellsBombed = this.cells.filter(cell => cell.flag).every(cell => cell.bomb)
      if (allBombCellsFlagged && allFlagCellsBombed) {
        this.makeAllCellsVisible()
        alert('Win!')
      }
    }
  },
  data() {
    return {
      field: new Array(this.height),
      cells: [],
      gameOver: false,
    }
  },
  beforeMount() {
    this.generateField()
  },
}
</script>

<style scoped>
  .row {
    height: 40px;
  }
</style>
