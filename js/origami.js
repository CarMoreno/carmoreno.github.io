var $rabbit = $('.rabbit-fold').oriDomi({
 	vPanels: 4
});
var $elephant = $('.elephant-fold').oriDomi({
	hPanels: 6
})
var $clavel = $('.clavel-fold').oriDomi({
  	hPanels: 6
});
$rabbit.oriDomi('accordion', -30);
$elephant.oriDomi('stairs', -18);
$clavel.oriDomi('reveal', 20, 'top');