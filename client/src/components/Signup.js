import React, { useRef, useState, useContext } from "react";
import { Form, Button, Card, Alert, Container } from "react-bootstrap";

import { Link, useHistory } from "react-router-dom"

// import { OurAuthContext } from "../contexts/OurAuthContext";


export default function Signup() {
  const emailRef = useRef();
  const nameRef = useRef();
  const phoneRef = useRef();
  const passwordRef = useRef();
  const passwordConfirmRef = useRef();
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);
  const history = useHistory()
//   const { signup, setCurrentUser, setMemberId } = useContext(OurAuthContext);

  async function handleSubmit(e) {
    e.preventDefault();

    if (passwordRef.current.value !== passwordConfirmRef.current.value) {
      return setError("Passwords do not match");
    }

    try {
      // setError("");
      // setLoading(true);

      console.log("perform signup");
    //   const res = await signup(emailRef.current.value, passwordRef.current.value);

    //   if (res.id){
    //     setCurrentUser(res.member_email);
    //     setMemberId(res.id);
    //     localStorage.setItem("savedUser", res.member_email);
    //     history.push("/");
    //   }
    //   else if (res.error){
    //     setError(res.error);
    //   }
      // history.push("/")
    } catch {
      setError("Failed to create an account");
    }

    setLoading(false);
  }

  return (
    <>
      <Container
        className="d-flex justify-content-center mt-4"
        style={{ minHeight: "100vh" }}
      >
        <div className="w-100" style={{ maxWidth: "500px" }}>
          <Card>
            <Card.Body className="card-form">
              <h3 className="mb-4">Sign Up</h3>
              {error && <Alert variant="danger">{error}</Alert>}
              <Form onSubmit={handleSubmit}>
                <Form.Group id="name">
                  <Form.Control placeholder="Name" type="text" ref={nameRef} required/>
                </Form.Group>
                <Form.Group id="email">
                  <Form.Control placeholder="Email" type="email" ref={emailRef} required />
                </Form.Group>
                <Form.Group id="phone">
                  <Form.Control placeholder="Phone Number" type="tel" ref={phoneRef} required />
                </Form.Group>
                <Form.Group id="password">
                  <Form.Control type="password" placeholder="Password" ref={passwordRef} required />
                </Form.Group>
                <Form.Group id="password-confirm">
                  <Form.Control
                    type="password"
                    placeholder="Confirm Password"
                    ref={passwordConfirmRef}
                    required
                  />
                </Form.Group>
                <Button
                  variant="secondary"
                  disabled={loading}
                  className="w-100 mb-4"
                  type="submit"
                  // style={{ backgroundColor: "#FFBA00" }}
                >
                  Sign Up
                </Button>
              </Form>
            </Card.Body>
          </Card>
          <div className="w-100 text-center mt-2">
            {/* Already have an account? <Link to="/login">Log In</Link> */}
            Already have an account? Log In
          </div>
        </div>
      </Container>
    </>
  );
}
