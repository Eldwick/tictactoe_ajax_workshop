function ready() {
  var mark = xTurn ? "X" : "O";

  $("td").click(function() {
    var tile = $(this),
        tileID = tile.data("tile-id");
    if(tile.text() == ''){
      tile.text(mark)
      $.post("/update_tile", {id: tileID, mark: mark}, function(data){
        console.log(data)
      })

      toggleMark()
    }
  })

  function toggleMark() {
    if (mark === "X") {
      mark = "O"
    } else {
      mark = "X"
    }
  }

  setInterval(function() {
    $.getJSON("/board/"+boardID, {}, function(data) {
      for(var i = 0; i < 3; i++) {
        for(var j = 0; j < 3; j++) {
          var mark = data[i][j]
          if (mark == null){
            mark = ''
          }           
          $("tr:nth-of-type("+(i+1)+") td:nth-of-type("+(j+1)+")").text(mark)
        }
      }
    })
  }, 1000)

}

$(document).ready(ready);
$(document).on('page:load', ready);