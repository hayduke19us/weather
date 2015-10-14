var React = require('react');
var FontA_ = require('react-fontawesome');

module.exports = React.createClass({
  render: function () {
    return (
      <a href='#'>
        <div className='widget thermostat'>
          <span className='climacon thermometer empty large-icon' />
        </div>
      </a>
    );
  }
})
