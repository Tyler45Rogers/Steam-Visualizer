<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Steam Games 2024 Visualized!</title>
    <script src="https://d3js.org/d3.v7.min.js"></script>
    <link rel="stylesheet" href="/static/main.css">
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
        }

        #chart-container {
            width: 100%;
            height: 100%;
            padding: 20px;  /* Whitespace so the treemap doesnt go on the edge */
            box-sizing: border-box;
            border: 2px solid #333;
            margin: 0 auto;
            overflow: hidden;
        }

        #chart {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
    </style>
</head>
<body>
    <h1>Steam Games 2024 Treemap</h1>

    <p><a href="/report">View Project Report</a></p>

    <form id="optionsForm">
        <label for="type">Data Type:</label>
        <select id="type">
            <option value="ccu">Peak CCU</option>
            <option value="playtime">Average Playtime</option>
        </select>
        <label for="filterType">Filter By:</label>
        <select id="filterType">
            <option value="">None</option>
            <option value="genre">Genre</option>
            <option value="category">Category</option>
        </select>
        <label for="filterValue">Select Genre (Action by default)/Category (Single-Player by default):</label>
        <select id="filterValue" disabled></select>

    
        <label for="numGames">Number of Games:</label>
        <input type="number" id="numGames" value="30" min="1">

        <button type="submit">Load Data</button>
    </form>

    <!-- Chart container with border and padding -->
    <div id="chart-container">
        <div id="chart"></div>
    </div>

    <script>
        //Get the genres or categories
        async function fetchFilterOptions(type) {
            const res = await fetch(`/api/filters/${type}`);
            const data = await res.json();

            const filterSelect = document.getElementById('filterValue');
            filterSelect.innerHTML = '<option value="">Select a ' + type + '...</option>';

            if (data.data) {
                data.data.forEach(item => {
                    const option = document.createElement('option');
                    option.value = item[0];
                    option.textContent = item[0];
                    filterSelect.appendChild(option);
                });
            }
        }


        document.getElementById('filterType').addEventListener('change', async function () {
            const filterType = this.value;
            const filterValue = document.getElementById('filterValue');

            //Cant choose genres or categories unless one is selected to filter by
            if (filterType === 'genre' || filterType === 'category') {
                filterValue.disabled = false;
                await fetchFilterOptions(filterType);
            } else {
                filterValue.disabled = true;
                filterValue.innerHTML = '';
            }
        });

        document.getElementById('optionsForm').addEventListener('submit', async (e) => {
            e.preventDefault();

            const type = document.getElementById('type').value;
            const filterType = document.getElementById('filterType').value;
            const filterValue = document.getElementById('filterValue').value.trim();
            const numGames = parseInt(document.getElementById('numGames').value) || 30;

            let url = `/api/games/${type}`;
            if (filterType && filterValue) {
                url += `/${filterType}?${filterType}=${encodeURIComponent(filterValue)}&limit=${numGames}`;
            } else {
                url += `?limit=${numGames}`;
            }

            try {
                const res = await fetch(url);
                const json = await res.json();

                if (!json.data || json.data.length === 0) {
                    alert("No data returned.");
                    return;
                }

                drawTreemap(json.data, type);
            } catch (err) {
                console.error("Fetch error:", err);
            }
        });

        // Function to draw the treemap - d3.js stuff
        function drawTreemap(data, type) {
            const chart = d3.select("#chart");
            chart.selectAll("*").remove();  // Clear previous chart

            const width = window.innerWidth - 40;  // Get current window width minus padding
            const height = window.innerHeight - 40;  // Get current window height minus padding

            // Create a root hierarchy for the data
            const root = d3.hierarchy({ children: data })
                .sum(d => type === "ccu" ? d.peak_ccu : d.average_playtime_forever);

            // Apply the treemap layout
            d3.treemap()
                .size([width, height])
                .padding(2)(root);

            // Append the SVG to the chart
            const svg = chart.append("svg")
                .attr("width", width)
                .attr("height", height);

            // Find the maximum value among all the blocks (leaves)
            const maxValue = d3.max(root.leaves(), d => d.value);

            // Create a color scale based on the size relative to the largest block
            const colorScale = d3.scaleLinear()
                .domain([0, maxValue])  // Domain from 0 to the size of the largest block
                .range(["#ba1e35", "#952db3"]);  // red to purple

            // Create a group for each block in the treemap
            const nodes = svg.selectAll("g")
                .data(root.leaves())
                .enter().append("g")
                .attr("transform", d => `translate(${d.x0},${d.y0})`);

            // Append the rectangles for each block
            nodes.append("rect")
                .attr("width", d => d.x1 - d.x0)
                .attr("height", d => d.y1 - d.y0)
                .attr("fill", d => colorScale(d.value))  // Apply the color scale based on the value
                .attr("stroke", "white");

            // Add a title to each block (shows name and value on hover)
            nodes.append("title")
                .text(d => `${d.data.name}\n${type === "ccu" ? d.data.peak_ccu : d.data.average_playtime_forever}`);

            // Add text inside each block
            nodes.append("text")
                .attr("x", 4)
                .attr("y", 14)
                .text(d => d.data.name)
                .attr("font-size", "10px")
                .attr("fill", "white");
        }


        // Listen for window resize and redraw treemap
        window.addEventListener('resize', () => {
            const chart = d3.select("#chart");
            chart.selectAll("*").remove();  // Clear the existing treemap

            //Redo treemap with the new size
            const filterType = document.getElementById('filterType').value;
            const filterValue = document.getElementById('filterValue').value.trim();
            const numGames = parseInt(document.getElementById('numGames').value) || 30;
            const type = document.getElementById('type').value;
            
            let url = `/api/games/${type}`;
            if (filterType && filterValue) {
                url += `/${filterType}?${filterType}=${encodeURIComponent(filterValue)}&limit=${numGames}`;
            } else {
                url += `?limit=${numGames}`;
            }

            fetch(url)
                .then(response => response.json())
                .then(json => {
                    if (json.data && json.data.length > 0) {
                        drawTreemap(json.data, type);
                    }
                })
                .catch(err => console.error("Fetch error during resize:", err));
        });
    </script>
</body>
</html>
