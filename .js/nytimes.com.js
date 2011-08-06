alert('hello');

//Here's the old stuff:
$('overlay').hide();
$('gatewayCreative').hide();
$(document.body).setStyle( { overflow:'scroll' } );

//April 28th update:
document.getElementsByTagName("html")[0].style.overflow='';

try {
    //Get the first graph:
    var url = window.location.href;
    new Ajax.Request(url, {
        method: 'get',
        onSuccess: function(transport) {
            var notice = $('notice');
            //alert(transport);
            fulltext = transport.responseText;
            //And here's my dirty secret, I don't know how to manipulate the DOM with prototype.js
            var pattern=/\/NYT_CORRECTION_TOP>\n    <p>\n(.*)<\/p>/gi;
            text = pattern.exec(fulltext)
            firstgraph = text[1];

        }
    });

} catch (e) {
    firstgraph= "[NYTClean note, I'm looking into getting this paragraph back.]";
}

text2 = $('article').getElementsByClassName('articleBody')[0];
if(text2.innerHTML.indexOf("20 free articles")>0) {
    text2.innerHTML = firstgraph;
}

