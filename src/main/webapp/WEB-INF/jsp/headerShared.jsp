<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
   
   
<style>
  .block {border:2px solid #17A2B8; padding:0 5px; height:25px; overflow:hidden; background:#fff; width:200px; font-family:Gulim; font-size:20px;}
  .block ul,
  .block li {margin:0; padding:0; list-style:none;}
  .block li a {display:block; height:20px; line-height:20px; color:#555; text-decoration:none;}
  .block li span {padding:2px 5px; background:#17A2B8; color:#fff; font-weight:bold; margin-right:3px;}
</style>

 
<script>
  $(function(){
          var ticker = function()
          {
              setTimeout(function(){
              $('#ticker li:first').animate( {marginTop: '-20px'}, 400, function()
              {
                  $(this).detach().appendTo('ul#ticker').removeAttr('style');
              });
              ticker();
          }, 2000);
      };
      ticker();
  });
</script>