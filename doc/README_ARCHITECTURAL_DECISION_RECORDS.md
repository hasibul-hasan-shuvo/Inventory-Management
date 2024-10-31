# ADR(Architectural Decision Records)

<ul>
<li>
<h3>App white labeling</h3>
<details>
    <summary>Decision</summary>
    <h6>Date: 18 June 2024</h6>
    <h4>Context</h4>
    <p>New DAB company wants the same product so decided to do white labeling the project.</p>
    <h4>Solution</h4>
    <p>Managed separate build flavors for separate companies and Managed the theme, app colors and company specific data from the flavor main to do white labeling.</p>
</details>
</li>
<li>
<h3>Offline support</h3>
<details>
    <summary>Decision</summary>
    <h6>Date: 26 April 2024</h6>
    <h4>Context</h4>
    <p>Jacobsen wanted to allow the users to use app in offline for the inventory management.</p>
    <h4>Solution</h4>
    <p>Saving the data in local database first then syncing the data to the server when the device is online. <br><br> This service only implemented for inventory create, update, delete, and product in and out option.</p>
</details>
</li>
<li>
<h3>Handle unavailable products</h3>
<details>
    <summary>Decision</summary>
    <h6>Date: 04 April 2024</h6>
    <h4>Context</h4>
    <p>Jacobsen wanted to distinguish the available and unavailable products. So the user can identify the unavailable products and can replace that with another available product.</p>
    <h4>Solution</h4>
    <p>Added a isAvailable field to distinguish the available and unavailable products. And product replacement feature implemented for the unavailable products.</p>
</details>
</li>
<li>
<h3>Login with customer ID and email both</h3>
<details>
    <summary>Decision</summary>
    <h6>Date: 08 April 2024</h6>
    <h4>Context</h4>
    <p>Jacobsen wanted to allow user to login by using email and password or customer id and password.</p>
    <h4>Solution</h4>
    <p>Removed the email validation from email field.</p>
</details>
</li>
</ul>
<br>
<br>