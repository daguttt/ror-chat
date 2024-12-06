// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';

function loadPromptNewRoute() {
  if (window.location.pathname !== '/prompts/new') return;
  console.log('loadPromptNewRoute');

  const $processedInJobSwitch = document.getElementById(
    'prompt_processed_in_job'
  );
  const $promptForm = document.getElementById('prompt_form');

  const handleSwitchChange = () => {
    const checked = $processedInJobSwitch.checked;

    if (checked) {
      const $emailFormControl = createEmailFormControl();

      // Add email form control before the submit button
      $promptForm.lastElementChild.insertAdjacentElement(
        'beforebegin',
        $emailFormControl
      );
      return;
    }

    // Remove email input
    const $emailInput = $promptForm.querySelector(
      'input[name="prompt[email]"]'
    );
    $emailInput.parentElement.remove();
  };
  $processedInJobSwitch.addEventListener('change', handleSwitchChange);

  cleanRouteListeners([
    {
      element: $processedInJobSwitch,
      event: 'change',
      callback: handleSwitchChange,
    },
  ]);
}

function cleanRouteListeners(listeners) {
  const handleTurboLoad = () => {
    for (const listener of listeners) {
      listener.element.removeEventListener(listener.event, listener.callback);
    }
    document.removeEventListener('turbo:load', handleTurboLoad);
  };
  document.addEventListener('turbo:load', handleTurboLoad);
}

function createEmailFormControl() {
  const formControlHtml = /*html*/ `
    <label for="prompt_email" class="form-control">Email para recibir notificación</label>
    <input type="email" id="prompt_email" name="prompt[email]" class="py-2 px-3 block w-full border border-gray-200 rounded-lg focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none dark:bg-neutral-900 dark:border-neutral-700 dark:text-neutral-400 dark:placeholder-neutral-500 dark:focus:ring-neutral-600" placeholder="Email" required>
    <p class="mt-2 text-sm text-gray-500 dark:text-neutral-500" id="hs-input-helper-text"></p>
  `;

  const $container = document.createElement('div');
  $container.innerHTML = formControlHtml;
  return $container;
}

document.addEventListener('turbo:load', loadPromptNewRoute);
