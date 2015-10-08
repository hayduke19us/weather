var React = require('react');
var FontA_ = require('react-fontawesome');

module.exports = React.createClass({
  render: function() {
    return (
      <a href='#'>
        <div className='widget weather'>
          <h1>Weather</h1>
          <div className='center'>
            <FontA_ className='large-icon' name='cloud'
            style={{ color: 'white' }} />
          </div>
        </div>
      </a>
    );
  }
})
