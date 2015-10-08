var __path__ = '../../client/components/widgets/thermostat.jsx'
jest.dontMock(__path__)

var React = require('react'),
    ReactDom = require('react-dom'),
    TestUtils = require('react-addons-test-utils')

var Thermostat = require(__path__),
    thermostat_widget = TestUtils.renderIntoDocument(<Thermostat/>),
    widget = TestUtils.findRenderedDOMComponentWithClass(thermostat_widget, 'widget thermostat')

describe('thermostat', function(){
  it('has a class of widget thermostat', function() {
    expect(ReactDom.findDOMNode(widget).className).toEqual('widget thermostat')
  });
});
