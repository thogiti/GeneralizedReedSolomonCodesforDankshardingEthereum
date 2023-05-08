# Create a Generalized Reed-Solomon Code over GF(59) with parameters
C = codes.GeneralizedReedSolomonCode(GF(59).list()[1:41], 3, GF(59).list()[1:41])

# Create a random message vector and encode it using the GRS code
msg = random_vector(C.base_field(), C.dimension())
print("Original message:", msg)
c = C.encode(msg)

# Simulate the transmission of the encoded message with a static error rate of 3
err = 3
Chan = channels.StaticErrorRateChannel(C.ambient_space(), err)
Chan
r = Chan.transmit(c)

# Decode the received message to the code and check if it's equal to the original encoded message
c_dec = C.decode_to_code(r)
print("Are the decoded received message to the code and the original encoded message equal?",c_dec == c)

# Decode the received message to the original message and check if it's equal to the original message
m_unenc2 = C.decode_to_message(r)
print("Decoded received message", m_unenc2)
print("Are the decoded received message to the message and the original message equal?",m_unenc2 == msg)
