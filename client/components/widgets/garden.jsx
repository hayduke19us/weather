var React = require('react');
var FontA_ = require('react-fontawesome');

module.exports = React.createClass({
  render: function() {
    return (
      <a href='#'>
        <div className='widget garden'>
          <h1>Garden</h1>
          <div className='center'>
            <FontA_ className='large-icon' name='sun-o'
            style={{ color: 'white' }} />
          </div>
        </div>
      </a>
    );
  }
})
