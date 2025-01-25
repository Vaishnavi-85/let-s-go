document.getElementById("trip-form").addEventListener("submit", function (e) {
  e.preventDefault();

  // Get form inputs
  const destination = document.getElementById("destination").value;
  const budget = document.getElementById("budget").value;
  const activities = document.getElementById("activities").value.split(",");

  // Create a trip card
  const tripPlanDiv = document.getElementById("trip-plan");
  const tripCard = document.createElement("div");
  tripCard.className = "trip-card";
  tripCard.innerHTML = `
    <h3>Destination: ${destination}</h3>
    <p>Budget: $${budget}</p>
    <p>Activities: ${activities.map(activity => activity.trim()).join(", ")}</p>
  `;

  // Append the trip card to the trip plan section
  tripPlanDiv.appendChild(tripCard);

  // Clear form inputs
  document.getElementById("trip-form").reset();
});
