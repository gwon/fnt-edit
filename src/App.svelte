<script lang="ts">
  import { invoke } from "@tauri-apps/api/core";
  import { open } from "@tauri-apps/plugin-dialog";

  let name = $state("");
  let greeting = $state("");
  let selectedFile = $state("");

  async function greet() {
    greeting = await invoke("greet", { name });
  }

  async function browseFile() {
    try {
      const file = await open({
        multiple: false,
        filters: [
          {
            name: "FNT Files",
            extensions: ["fnt"],
          },
        ],
      });

      if (file) {
        selectedFile = Array.isArray(file) ? file[0] : file;
      }
    } catch (error) {
      console.error("Error opening file:", error);
    }
  }
</script>

<main>
  <div class="container">
    <h1>FNT Editor</h1>

    <div class="file-section">
      <button class="browse-btn" on:click={browseFile}>
        📁 Browse FNT File
      </button>
      {#if selectedFile}
        <p class="selected-file">Selected: {selectedFile}</p>
      {/if}
    </div>

    <div class="greet-section">
      <input bind:value={name} placeholder="Enter name" />
      <button on:click={greet}>Greet</button>
      <p>{greeting}</p>
    </div>
  </div>
</main>

<style>
  .container {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 2rem;
    gap: 2rem;
  }

  .file-section {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 1rem;
  }

  .browse-btn {
    background: #4f46e5;
    color: white;
    border: none;
    padding: 12px 24px;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.2s;
  }

  .browse-btn:hover {
    background: #4338ca;
  }

  .selected-file {
    color: #059669;
    font-weight: 500;
    word-break: break-all;
    text-align: center;
    max-width: 400px;
  }

  .greet-section {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 1rem;
  }

  input {
    padding: 8px 12px;
    border: 1px solid #d1d5db;
    border-radius: 4px;
    font-size: 14px;
  }

  button:not(.browse-btn) {
    background: #10b981;
    color: white;
    border: none;
    padding: 8px 16px;
    border-radius: 4px;
    cursor: pointer;
  }

  button:not(.browse-btn):hover {
    background: #059669;
  }
</style>
