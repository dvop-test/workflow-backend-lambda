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