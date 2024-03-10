    // 星星
    $(function () {
      $(".star_good").hover(function () {
        var id = $(this).attr("id").substr(4);
        for (var i = 1; i <= id; i++) {
          $("#star" + i).attr("src", "images/star1.png");
          $("#star" + i).width("30px");
          $("#star" + i).height("30px");
        }

      }, function () {
        for (var i = 1; i <= 5; i++) {
          $("#star" + i).attr("src", "images/star0.png");
          $("#star" + i).width("30px");
          $("#star" + i).height("30px");
        }
        for (var i = 1; i <= 5; i++) {
          if ($("#star" + i).hasClass("cat")) {
            for (var j = 1; j <= i; j++) {
              $("#star" + j).attr("src", "images/star1.png");
              $("#star" + j).width("30px");
              $("#star" + j).height("30px");
            }
            for (var k = i + 1; k <= 5; k++) {
              $("#star" + k).attr("src", "images/star0.png");
              $("#star" + k).width("30px");
              $("#star" + k).height("30px");
            }
            break;
          }
        }

      });


      $(".star_click").click(function () {
        var id = $(this).attr("id").substr(4);

        for (var i = 1; i <= 5; i++) {
          $("#star" + i).removeClass("cat");
        }

        $("#star" + id).addClass("cat");
        for (var i = 1; i <= id; i++) {
          $("#star" + i).attr("src", "images/star1.png");
          $("#star" + i).width("30px");
          $("#star" + i).height("30px");
        }

      });


    })