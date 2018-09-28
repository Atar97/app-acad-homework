import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      result: 0,
      num1: "",
      num2: ""
    };

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);

  }

  setNum1(event) {
    event.preventDefault();
    this.setState({ num1: event.target.value});
  }

  setNum2(event) {
    event.preventDefault();
    this.setState({ num2: event.target.value});
  }

  add(event) {
    event.preventDefault();
    const result = parseInt(this.state.num1) + parseInt(this.state.num2);
    this.setState({ result });
  }
  subtract(event) {
    event.preventDefault();
    const result = parseInt(this.state.num1) - parseInt(this.state.num2);
    this.setState({ result });
  }
  multiply(event) {
    event.preventDefault();
    const result = parseInt(this.state.num1) * parseInt(this.state.num2);
    this.setState({ result });
  }
  divide(event) {
    event.preventDefault();
    const result = parseInt(this.state.num1) / parseInt(this.state.num2);
    this.setState({ result });
  }
  clear(event) {
    event.preventDefault();
    this.setState({
      num1: "",
      num2: "",
      result: 0
    })
  }

  render(){
    return (
      <div>
        <h1>{this.state.result}</h1>
        <br />
        <input onChange={this.setNum1} value={this.state.num1}></input>
        <input onChange={this.setNum2} value={this.state.num2}></input>
        <button onClick={this.add.bind(this)}>+</button>
        <button onClick={this.subtract.bind(this)}>-</button>
        <button onClick={this.multiply.bind(this)}>*</button>
        <button onClick={this.divide.bind(this)}>/</button>
        <button onClick={this.clear.bind(this)}>CLEAR</button>
      </div>
    );
  }
}

export default Calculator;
