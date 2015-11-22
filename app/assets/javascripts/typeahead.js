// Typeahead function for dynamically showing professions while typing

var typeahead;
typeahead = function() {
  var professions = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    
    // get professions json from database
    // WARNING!! consult the storage limit!!
    prefetch: '/typeahead_professions',
    
    // receives objects in form {"id":1,"name":"Abbot","created_at":"2015-10-11T19:01:55.000Z","updated_at":"2015-10-11T19:01:55.000Z"}
    sorter : function(a, b) {
      var aName = a.name;
      var bName = b.name;
            
      // get input text
      var inputString = $('input.typeahead.tt-input').val();
      
      // move exact matches to top
      if (inputString == aName) { return -1; }
      if (inputString == bName) { return 1; }

      // close match without case matching
      if(inputString.toLowerCase() == aName.toLowerCase()) { return -1; }
      if(inputString.toLowerCase()== bName.toLowerCase()) { return 1; } 

      if( (inputString!=aName) && (inputString!=bName) ){
        var aNameCount = aName.replace( /[^\w ]/g, "" ).split( /\s+/ ).length;
        var bNameCount = bName.replace( /[^\w ]/g, "" ).split( /\s+/ ).length;
        if (aNameCount < bNameCount) {
          return -1;
        } else if (aNameCount > bNameCount) {
          return 1;
        } else
          return 0;
      }
    }
  });

  $('.typeahead').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  }, 
  {
    name: 'professions',
    display: 'name',
    source: professions,
    limit: 10
  });

};

$(document).ready(typeahead);
$(document).on('page:load', typeahead);