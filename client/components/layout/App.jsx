var React = require('react');

var Weather = require('../widgets/weather.jsx')

// Commented out for now SEE Ideas/Grocery list
// var Thermostat = require('../widgets/thermostat.jsx')
// var Garden = require('../widgets/garden.jsx')
// var Lights = require('../widgets/lights.jsx')
// var Internet = require('../widgets/internet.jsx')

module.exports = React.createClass({
  render: function () {
    return (
      <div className='container-fluid'>
        <div className='row'>
          <div className='col-lg-3'> 
            <Weather />
          </div>
        </div>
      </div>
    );
  }
});
