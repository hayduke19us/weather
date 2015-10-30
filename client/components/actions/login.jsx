var React = require('react')

var Icons = require('../layout/icons.jsx')

module.exports = React.createClass({

  render: function(){
    var url = './wood.jpg'
    var style = {
      backgroundImage: 'url(' + url +')'
    }
    return  (
      <div className='container-fluid blue-back'>
        <div className='row'>
          <div className='col-lg-8 white'>
            <h1>I forget to buy groceries. I even forget the 
            <strong> Grocery List.</strong></h1>
            <div className='center vcenter'>
              <image src='./notepaper.png' alt='No Image'/>
            </div>
          </div>
          <div className='col-lg-4'>
            <div className='widget garden white'>
              <h1>Login</h1>
              <h2>Email</h2>
              <input className='form-control' type='text' name='email' />
              <h1>Password</h1>
              <input className='form-control' type='text' name='email' />
            </div>
          </div>
        </div>
      </div>
    )
  }

})
