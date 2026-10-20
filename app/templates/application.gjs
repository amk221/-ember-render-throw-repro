import { pageTitle } from 'ember-page-title';

<template>
  {{pageTitle "EmberRenderThrowRepro"}}
  <h2 id="title">Welcome to Ember</h2>

  {{outlet}}
</template>
