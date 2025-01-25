document.getElementById("trip-form").addEventListener("submit", function (e) {
  e.preventDefault();

  // Get form inputs
  const destination = document.getElementById("destination").value;
  const budget = document.getElementById("budget").value;
  const activities = document.getElementById("activities").value.split(",");
  const accommodation = document.getElementById("accommodation").value;
  const transportation = document.getElementById("transportation").value;
  const packingList = document.getElementById("packing-list").value.split(",");
  const healthSafety = document.getElementById("health-safety").value;
  const documents = document.getElementById("documents").value;
  const weather = document.getElementById("weather").value;

  // Create a trip card
  const tripPlanDiv = document.getElementById("trip-plan");
  const tripCard = document.createElement("div");
  tripCard.className = "trip-card";
  tripCard.innerHTML = `
    <h3>Destination: ${destination}</h3>
    <p>Budget: $${budget}</p>
    <p>Activities: ${activities.map(activity => activity.trim()).join(", ")}</p>
    <p>Accommodation: ${accommodation}</p>
    <p>Transportation: ${transportation}</p>
    <p>Packing List: ${packingList.map(item => item.trim()).join(", ")}</p>
    <p>Health & Safety Info: ${healthSafety}</p>
    <p>Documents: ${documents}</p>
    <p>Weather Forecast: ${weather}</p>
  `;

  // Append the trip card to the trip plan section
  tripPlanDiv.appendChild(tripCard);

  // Clear form inputs
  document.getElementById("trip-form").reset();
});
