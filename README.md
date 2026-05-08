      - name: Build project
        run: npm run build

      - name: Package Lambda
        run: |
          pwd
          ls
          mkdir -p dist-package
          cp -r dist node_modules package.json dist-package/
          cd dist-package && zip -r ../lambda.zip .

      - name: Upload artifact
        id: artifact
        uses: actions/upload-artifact@v5
        with:
          name: lambda-artifact
          path: lambda.zip

make \
          -C ${{ github.workspace }}/app \
          -f ${{ github.action_path }}/../../makefiles/setup.mk \
          env-setup


- name: Run Makefile Target
  id: base_run_step 
  run: |
    # -I .             -> Busca includes en la carpeta actual (hijo)
    # -I central-logic -> Busca includes en la carpeta del padre
    make -I . -I central-logic update.lambda LAMBDA_ROOT=${{ github.workspace }}/app
    echo "zip_result=app/dist/lambda.zip" >> $GITHUB_OUTPUT

- name: Usar el resultado 1
  working-directory: ./app/dist
  run: |
    echo "El Makefile guardó el archivo en: ${{ steps.base_run_step.outputs.zip_result }}"
    ls -la