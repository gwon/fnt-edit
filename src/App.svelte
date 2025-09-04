<script lang="ts">
  import { invoke } from "@tauri-apps/api/core";

  let name = "";
  let greeting = "";

  async function greet() {
    greeting = await invoke("greet", { name });
  }
</script>

<main>
  <h1>Welcome to Tauri!</h1>
  <input bind:value={name} placeholder="Enter name" />
  <button on:click={greet}>Greet</button>
  <p>{greeting}</p>
</main>
