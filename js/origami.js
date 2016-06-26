var $rabbit = $('.rabbit-fold').oriDomi({
 	vPanels: 4
});
var $elephant = $('.elephant-fold').oriDomi({
	hPanels: 6
})
var $clavel = $('.clavel-fold').oriDomi({
  	hPanels: 6
});
var $rat = $('.rat-fold').oriDomi({
	hPanels: 8
});
var $lion = $('.lion-fold').oriDomi({
	hPanels: 4
});

$rabbit.oriDomi('accordion', -30);
$elephant.oriDomi('stairs', -18);
$clavel.oriDomi('reveal', 30, 'top');
$rat.oriDomi('stairs', -15);
$lion.oriDomi('fracture', -1.5);