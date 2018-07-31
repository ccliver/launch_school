var bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

function processBands(bands) {
  bands.map(function (band) {
    updateCountry(band);
    capitalizeBandName(band);
    removeDotsInBandName(band);
    return band;
  });

  return bands;
}

function updateCountry(band) {
  band.country = 'Canada';
}

function capitalizeBandName(band) {
  band.name = band.name.split(' ').map(function (band) {
    return band.substr(0, 1).toUpperCase() + band.substr(1);
  }).join(' ');
}

function removeDotsInBandName(band) {
  band.name = band.name.replace(/\./, '');
}

console.log(processBands(bands));

// should return:
//[
//  { name: 'Sunset Rubdown', country: 'Canada', active: false },
//  { name: 'Women', country: 'Canada', active: false },
//  { name: 'A Silver Mt Zion', country: 'Canada', active: true },
//]
