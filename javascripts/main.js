(function(){var n;window.location_pathname=function(){return location.pathname.replace(/index.\w+$/,"")},n=function(){},$(function(){return n(),$("article.single").find("a").each(function(n,t){return $(t).attr("target","_blank")}),$(".aside img").on("click",function(n){return n.preventDefault(),$(this).parent(".aside").toggleClass("stretch")}),$(".rss a").on("click",function(n){return n.preventDefault(),n.stopPropagation(),$(".subscribe-form form").toggle()})})}).call(this);