<template>
  <div class="cell" :class="classes()">
    <!-- {{ cell }} -->
  </div>
</template>

<script>
export default {
  name: 'Cell',
  props: {
    x: Number,
    y: Number,
    cell: Object,
  },
  methods: {
    classes() {
      let h = {}
      if (this.cell) {
        if (this.cell.bomb) h['cell-bomb'] = true
        if (this.cell.error) h['cell-error'] = true
        if (this.cell.n) h[`cell-${this.cell.n}`] = true
      }
      return h
    }
  }
}
</script>

<style scoped>
  .cell {
    display: inline-block;
    width: 40px;
    height: 40px;
    border: 1px solid black;
    text-align: center;
    font-size: 40px;
    padding: 0;
    margin: 0;
    /* background: red; */
    /* border-radius: 3px; */
    cursor: pointer;
  }
  .cell:before {
    content: ' ';
  }
  .cell.cell-error {
    background: red;
  }
  .cell.cell-bomb:before {
    content: '💣';
  }
  .cell.cell-1:before {
    content: '1';
  }
  .cell.cell-2:before {
    content: '2';
  }
  .cell.cell-3:before {
    content: '3';
  }
  .cell.cell-4:before {
    content: '4';
  }
  .cell.cell-5:before {
    content: '5';
  }
  .cell.cell-6:before {
    content: '6';
  }
  .cell.cell-7:before {
    content: '7';
  }
  .cell.cell-8:before {
    content: '8';
  }
</style>
