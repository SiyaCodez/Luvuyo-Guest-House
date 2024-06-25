<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Luvuyo2.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    



<style>
        body {
            font-family: Poppins-Regular;
            background-color: #006666;
            margin: 0;
            padding: 0 0 20px 0 ;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 150vh;
        }

        form {
            position: absolute;
            center: 100px;
            top: 120px;
            max-width: 400px;
            width: 100%;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 12px;
            box-sizing: border-box;
            border: 1px solid #f1c232;
            border-radius: 4px;
        }

        #card-element {
            margin-bottom: 16px;
        }

        .Khokha {
            background-color: #006666;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .h1{
            color: #006666;
            font-size: 0.5rem;
        }

        Khokha:hover {
            background-color: #006666;
        }
        
        #card-errors {
            color: #ff0000;
            margin-top: 12px;
        }

        /* Optional: Add media queries for responsiveness */
        @media (max-width: 600px) {
            form {
                max-width: 100%;
            }
        }
    </style>

    
    <script src="https://js.stripe.com/v3/"></script>

 

            <label for="cardNumber">Card Number:</label>
            <div id="card-element">
                <!-- A Stripe Element will be inserted here. -->
            </div>

            <!-- Used to display form errors. -->
            <div id="card-errors" role="alert"></div>
        </div>
    <asp:Button ID="Khokha" runat="server" Text="Confirm Payment" OnClick="Khokha_Click" Width="313px" />
       
   

    <script>
        var stripe = Stripe('your_stripe_public_key');
        var elements = stripe.elements();

        // Create an instance of the card Element.
        var card = elements.create('card');

        // Add an instance of the card Element into the `card-element` div.
        card.mount('#card-element');

        // Handle real-time validation errors from the card Element.
        card.addEventListener('change', function (event) {
            var displayError = document.getElementById('card-errors');
            if (event.error) {
                displayError.textContent = event.error.message;
            } else {
                displayError.textContent = '';
            }
        });

        // Handle form submission.
        var form = document.getElementById('payment-form');
        form.addEventListener('submit', function (event) {
            event.preventDefault();

            stripe.createToken(card).then(function (result) {
                if (result.error) {
                    // Inform the user if there was an error.
                    var errorElement = document.getElementById('card-errors');
                    errorElement.textContent = result.error.message;
                } else {
                    // Send the token to your server.
                    stripeTokenHandler(result.token);
                }
            });
        });

        function stripeTokenHandler(token) {
            // Insert the token ID into the form so it gets submitted to the server.
            var hiddenField = document.createElement('input');
            hiddenField.setAttribute('type', 'hidden');
            hiddenField.setAttribute('name', 'stripeToken');
            hiddenField.setAttribute('value', token.id);
            form.appendChild(hiddenField);

            // Submit the form.
            form.submit();
        }
    </script>

</asp:Content>
